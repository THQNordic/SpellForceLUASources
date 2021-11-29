-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 215.627884 , 182.148636 , 14.017502 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(11419);]] )
   Camera:MotionSpline_AddSplinePoint( 215.538727 , 192.773285 , 14.017502 , 6.899996 , [[Camera:ScriptSplineLookAtNpc(11419);]] )
   Camera:MotionSpline_AddSplinePoint( 215.423203 , 206.538788 , 14.017502 , 9.800001 , [[Camera:ScriptSplineLookAtNpc(11419);]] )
   Camera:MotionSpline_AddSplinePoint( 215.313873 , 219.568069 , 14.017502 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(11419);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
