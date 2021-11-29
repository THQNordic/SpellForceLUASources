-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 292.975067 , 303.802216 , 35.037781 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);]] )
   Camera:MotionSpline_AddSplinePoint( 310.847260 , 302.154114 , 29.823044 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 331.785583 , 303.681122 , 30.137289 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 358.200043 , 312.869904 , 31.797743 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 362.173889 , 335.643127 , 29.877760 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 335.043732 , 374.599854 , 23.337566 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 316.302002 , 373.561676 , 23.146971 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 308.768738 , 381.416626 , 16.746603 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 45.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
