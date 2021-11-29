-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 64.954483 , 493.534973 , 43.988239 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(6046);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 69.949135 , 493.099152 , 44.178139 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 76.339432 , 492.944366 , 44.069988 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 83.613487 , 492.488708 , 43.808281 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
